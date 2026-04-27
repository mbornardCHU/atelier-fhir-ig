import os
import subprocess
import threading
import tkinter as tk
from tkinter import filedialog, messagebox, scrolledtext
import datetime


class FHIRValidatorGUI:
    def __init__(self, root: tk.Tk):
        self.root = root
        self.root.title("FHIR Validator Launcher")
        self.root.geometry("900x650")

        self.validator_jar = tk.StringVar(value="./validator-test/validator_cli.jar")
        self.ig_package = tk.StringVar(value="./output/package.tgz")
        self.resource_file = tk.StringVar()
        self.fhir_version = tk.StringVar(value="5.0.0")
        self.output_file = None

        self._build_ui()

    def _build_ui(self) -> None:
        main = tk.Frame(self.root, padx=10, pady=10)
        main.pack(fill="both", expand=True)

        self._build_file_row(
            parent=main,
            label="Validator JAR",
            variable=self.validator_jar,
            browse_command=lambda: self._browse_file(
                self.validator_jar,
                [("JAR files", "*.jar"), ("All files", "*.*")]
            )
        )

        self._build_file_row(
            parent=main,
            label="IG package (.tgz)",
            variable=self.ig_package,
            browse_command=lambda: self._browse_file(
                self.ig_package,
                [("TGZ files", "*.tgz"), ("All files", "*.*")]
            )
        )

        self._build_file_row(
            parent=main,
            label="FHIR resource (.json)",
            variable=self.resource_file,
            browse_command=lambda: self._browse_file(
                self.resource_file,
                [("JSON files", "*.json"), ("All files", "*.*")]
            )
        )

        version_frame = tk.Frame(main)
        version_frame.pack(fill="x", pady=6)

        tk.Label(version_frame, text="FHIR version", width=18, anchor="w").pack(side="left")
        tk.Entry(version_frame, textvariable=self.fhir_version).pack(
            side="left", fill="x", expand=True, padx=(0, 8)
        )

        button_frame = tk.Frame(main)
        button_frame.pack(fill="x", pady=10)

        self.validate_button = tk.Button(
            button_frame,
            text="Lancer la validation",
            command=self._start_validation,
            height=2
        )
        self.validate_button.pack(side="left")

        clear_button = tk.Button(
            button_frame,
            text="Vider la sortie",
            command=self._clear_output
        )
        clear_button.pack(side="left", padx=8)

        tk.Label(main, text="Sortie du validateur").pack(anchor="w", pady=(8, 4))

        self.output = scrolledtext.ScrolledText(main, wrap="word", height=25)
        self.output.pack(fill="both", expand=True)

    def _build_file_row(self, parent, label, variable, browse_command) -> None:
        row = tk.Frame(parent)
        row.pack(fill="x", pady=6)

        tk.Label(row, text=label, width=18, anchor="w").pack(side="left")
        tk.Entry(row, textvariable=variable).pack(side="left", fill="x", expand=True, padx=(0, 8))
        tk.Button(row, text="Parcourir", command=browse_command).pack(side="left")

    def _browse_file(self, variable: tk.StringVar, filetypes) -> None:
        path = filedialog.askopenfilename(filetypes=filetypes)
        if path:
            variable.set(path)

    def _clear_output(self) -> None:
        self.output.delete("1.0", tk.END)

    def _append_output(self, text: str) -> None:
        self.output.insert(tk.END, text)
        self.output.see(tk.END)

        if self.output_file:
            self.output_file.write(text)
            self.output_file.flush()

    def _validate_inputs(self) -> bool:
        if not self.validator_jar.get():
            messagebox.showerror("Erreur", "Sélectionne le fichier validator .jar")
            return False
        if not os.path.isfile(self.validator_jar.get()):
            messagebox.showerror("Erreur", "Le fichier validator .jar est introuvable")
            return False

        if not self.ig_package.get():
            messagebox.showerror("Erreur", "Sélectionne le package IG .tgz")
            return False
        if not os.path.isfile(self.ig_package.get()):
            messagebox.showerror("Erreur", "Le package IG .tgz est introuvable")
            return False

        if not self.resource_file.get():
            messagebox.showerror("Erreur", "Sélectionne la ressource JSON")
            return False
        if not os.path.isfile(self.resource_file.get()):
            messagebox.showerror("Erreur", "La ressource JSON est introuvable")
            return False

        return True

    def _start_validation(self) -> None:
        if not self._validate_inputs():
            return

        self.validate_button.config(state="disabled")
        self._clear_output()

        thread = threading.Thread(target=self._run_validation, daemon=True)
        thread.start()
        timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        output_path = f"validation_{timestamp}.log"

        self.output_file = open(output_path, "w", encoding="utf-8")

    def _run_validation(self) -> None:
        cmd = [
            "java",
            "-jar",
            self.validator_jar.get(),
            self.resource_file.get(),
            "-version",
            self.fhir_version.get(),
            "-ig",
            self.ig_package.get()
        ]

        self.root.after(0, lambda: self._append_output("Commande exécutée :\n"))
        self.root.after(0, lambda: self._append_output(" ".join(f'"{c}"' if " " in c else c for c in cmd) + "\n\n"))

        try:
            process = subprocess.Popen(
                cmd,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True,
                bufsize=1
            )

            assert process.stdout is not None
            for line in process.stdout:
                self.root.after(0, lambda l=line: self._append_output(l))

            return_code = process.wait()

            if return_code == 0:
                self.root.after(0, lambda: self._append_output("\nValidation terminée avec succès.\n"))
            else:
                self.root.after(0, lambda: self._append_output(f"\nValidation terminée avec erreurs. Code retour : {return_code}\n"))
            
            if self.output_file:
                self.output_file.close()
                

        except FileNotFoundError:
            self.root.after(0, lambda: messagebox.showerror("Erreur", "Java est introuvable. Vérifie ton installation et ton PATH."))
        except Exception as e:
            self.root.after(0, lambda: messagebox.showerror("Erreur", f"Erreur inattendue : {e}"))
        finally:
            self.root.after(0, lambda: self.validate_button.config(state="normal"))


def main() -> None:
    root = tk.Tk()
    app = FHIRValidatorGUI(root)
    root.mainloop()


if __name__ == "__main__":
    main()