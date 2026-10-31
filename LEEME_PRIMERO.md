# Demostración: Python + GitHub

## Qué necesitas
Python 3.11 o superior, Git y una cuenta de GitHub. Internet para instalar pytest y enviar el repositorio. Este ZIP no crea un repositorio remoto ni incluye un entorno virtual: se genera en tu computadora.

## 1. Empezar en Windows
Extrae TODO el ZIP. Abre la carpeta Demo_Python_GitHub y haz doble clic en INICIAR_WINDOWS.bat. Creará el entorno, instalará pytest y ejecutará la calculadora y sus tres pruebas.
Si Python no está instalado, instálalo primero con su opción de agregarlo a PATH.

Alternativa desde la terminal de VS Code, ubicada en la carpeta del proyecto:

```powershell
python -m venv venv
.\venv\Scripts\python.exe -m pip install -r requirements.txt
.\venv\Scripts\python.exe -m pytest -v
```

En Linux/macOS usa python3 -m venv venv y venv/bin/python en lugar de .\venv\Scripts\python.exe.

## 2. Conectar con GitHub (preparar antes de exponer)
Crea en GitHub un repositorio VACÍO llamado demo-python-github, sin README ni licencia. En la terminal de esta carpeta ejecuta:

```bash
git init
git add .
git commit -m "Agregar calculadora, pruebas e integracion continua"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/demo-python-github.git
git push -u origin main
```

Reemplaza TU_USUARIO con tu usuario real. Si Git solicita identidad, configura tu nombre y correo antes del commit. Completa el inicio de sesión que solicite GitHub. En Actions espera una ejecución en verde.

## 3. Demostración en vivo: provocar un fallo
En la terminal de Windows:

```powershell
git switch -c prueba-fallo
.\venv\Scripts\python.exe demo.py romper
.\venv\Scripts\python.exe -m pytest -v
git add calculadora.py
git commit -m "Introducir error intencional para la demostracion"
git push -u origin prueba-fallo
```

Las pruebas DEBEN fallar: el script cambió la suma por una resta. Abre GitHub > Actions y muestra la ejecución roja y el detalle de la prueba.

Di: “El código se pudo subir, pero las pruebas detectaron un comportamiento incorrecto. La rama main conserva la versión correcta.”

## 4. Corregir

```powershell
.\venv\Scripts\python.exe demo.py corregir
.\venv\Scripts\python.exe -m pytest -v
git add calculadora.py
git commit -m "Corregir la suma"
git push
```

Muestra la nueva ejecución verde. Abre un Pull Request desde prueba-fallo hacia main para enseñar la revisión y las comprobaciones. Como la corrección restaura la función original, el cambio neto puede estar vacío: muestra la pestaña de commits y explica que ambos pasos quedaron registrados.

Di: “Al corregir la función, las pruebas vuelven a pasar. El historial permite ver el error y su corrección.”

## Qué contiene
- calculadora.py: función sumar y ejecución de ejemplo.
- test_calculadora.py: tres pruebas reales de la suma.
- requirements.txt: dependencia para instalar las pruebas.
- .gitignore: excluye entorno, caché y archivos .env.
- .github/workflows/pruebas.yml: pruebas automáticas en GitHub.
- demo.py: introduce o corrige el error intencional.
- INICIAR_WINDOWS.bat: preparación local con doble clic.

## Relación con las diapositivas
Entorno virtual: creación de venv. Exclusiones: .gitignore. Portabilidad: requirements.txt. Trabajo en equipo: rama y Pull Request. Integración continua: ejecución roja y luego verde en Actions.

## Si algo falla
- No se reconoce Python: instala Python y vuelve a abrir la terminal.
- No se reconoce Git: instala Git y vuelve a abrir VS Code.
- No module named pytest: vuelve a ejecutar la instalación con el Python del entorno.
- Actions tarda: espera la ejecución; el color de pytest local sirve para explicar mientras tanto.
- No hay internet: puedes mostrar pytest local, pero Actions requiere enviar cambios a GitHub.
