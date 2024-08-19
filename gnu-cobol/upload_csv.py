import requests
import sys

def upload_csv(file_path):
    url = 'http://localhost:3000/upload'
    try:
        # Abre el archivo en modo lectura binaria
        with open(file_path, 'rb') as file:
            files = {'file': file}
            response = requests.post(url, files=files)
            
            # Verifica si la solicitud fue exitosa
            if response.status_code == 200:
                print("Archivo subido exitosamente.")
                print("Respuesta del servidor:", response.json())
            else:
                print("Error: {}".format(response.status_code))
                print(response.text)
    except FileNotFoundError:
        print("Error: El archivo '{}' no se encontro.".format(file_path))
    except Exception as e:
        print("Ocurrio un error: {}".format(e))

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Uso: python upload_csv.py <ruta_al_archivo_csv>")
    else:
        file_path = sys.argv[1]
        upload_csv(file_path)
