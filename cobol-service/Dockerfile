# Usa una imagen base de Ubuntu
FROM ubuntu:20.04

# Actualiza el sistema e instala dependencias
RUN apt-get update && \
    apt-get install -y \
    gnupg \
    curl \
    build-essential \
    wget \
    gnucobol \
    vim  # Instala Vim para tener una herramienta de edición y un shell interactivo

# Establece el directorio de trabajo
WORKDIR /workspace

# Copia los archivos COBOL y CSV al contenedor
COPY UploadCsv.cob /workspace/
COPY mock_data.csv /workspace/

# Compila el programa COBOL
# RUN cobc -x UploadCsv.cob

# Comando por defecto para mantener el contenedor activo
CMD ["tail", "-f", "/dev/null"]
