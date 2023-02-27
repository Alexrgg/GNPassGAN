#!/bin/bash


#   Instala y prepara el entorno para entrenar el modelo GNPassGAN y PassGAN

#   El script se ha probado sobre un docker con miniconda3 preinstalado:
#   % docker pull conda/miniconda3
#   % docker run -it --platform linux/x86_64 conda/miniconda3 /bin/bash
#   % docker cp ./GNPASSGAN 444813e136b5:/home


###  Crear entorno ### 
echo "Creando entorno passgan..."
conda create -n passgan python=3.8 -y
echo "Activando entorno"
conda activate passgan
echo "Instalar pip"
conda install pip -y
echo "Intalar requirements.txt"
pip install -r requirements.txt


### Train GNPassGAN ###
training_data='./data/test_rockyou812.txt'
output_dir='../PassGAN_data/GNPassGAN_12-02-2023'
n_iters=20000

python3 './models.py' --training-data '{training_data}'  --output-dir '{output_dir}' --iters '{n_iters}'


### Train PassGAN ###