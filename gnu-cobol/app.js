const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const app = express();
const port = 3000;

// Crea el directorio de carga si no existe
if (!fs.existsSync('uploads')) {
  fs.mkdirSync('uploads');
}

// Configura multer para manejar archivos subidos con validación de tamaño y tipo de archivo
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/');
  },
  filename: (req, file, cb) => {
    cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
  }
});

// Función de filtro para validar tipo de archivo
const fileFilter = (req, file, cb) => {
  const extname = path.extname(file.originalname).toLowerCase();
  const mimetype = file.mimetype;

  console.log('File extension:', extname);
  console.log('File MIME type:', mimetype);

  if (extname === '.csv' && mimetype === 'text/csv') {
    return cb(null, true);
  } else {
    cb(new Error('Invalid file type. Only CSV files are allowed.'));
  }
};

// Limitar tamaño máximo a 4MB
const upload = multer({
  storage: storage,
  limits: { fileSize: 4 * 1024 * 1024 }, // 4MB
  fileFilter: fileFilter
});

// Manejo de ruta POST para subir archivo
app.post('/upload', upload.single('file'), (req, res) => {
  if (!req.file) {
    return res.status(400).json({ error: 'No file uploaded' });
  }

  // En este punto, el archivo ha pasado todas las validaciones
  res.json({ message: 'File uploaded successfully', file: req.file });
});

// Manejo de errores de multer (ej. tamaño de archivo)
app.use((err, req, res, next) => {
  if (err instanceof multer.MulterError) {
    // Errores de multer, por ejemplo, tamaño de archivo
    if (err.code === 'LIMIT_FILE_SIZE') {
      return res.status(400).json({ error: 'File size exceeds the limit of 2MB' });
    }
  } else if (err) {
    // Otros errores, por ejemplo, tipo de archivo
    return res.status(400).json({ error: err.message });
  }
  next();
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
