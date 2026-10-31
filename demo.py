"""Introduce o corrige un error intencional. Ejecutar desde la carpeta del proyecto."""
import argparse
from pathlib import Path

parser = argparse.ArgumentParser(description="Demostracion: rojo y verde en las pruebas")
parser.add_argument("accion", choices=["romper", "corregir"])
args = parser.parse_args()
archivo = Path(__file__).with_name("calculadora.py")
texto = archivo.read_text(encoding="utf-8")
if args.accion == "romper":
    texto = texto.replace("return a + b", "return a - b")
else:
    texto = texto.replace("return a - b", "return a + b")
archivo.write_text(texto, encoding="utf-8")
print("Error intencional introducido." if args.accion == "romper" else "Suma corregida.")
print("Ejecuta: python -m pytest -v")
