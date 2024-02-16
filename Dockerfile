FROM python:3.7

# Install project
WORKDIR /app
RUN apt-get update && \
    apt-get install -y git libgl1-mesa-glx nano && \
    git clone https://github.com/zuruoke/watermark-removal.git

# Setup directory
WORKDIR /app/watermark-removal
RUN rm -f /app/watermark-removal/model/* &&\
    mkdir -p /app/watermark-removal/In /app/watermark-removal/Out

# Install dependancies
RUN pip install tensorflow==1.15.0 && \
    pip install protobuf==3.20.0 && \
    pip install opencv-python && \
    pip install Pillow && \
    pip install PyYAML && \
    pip install git+https://github.com/JiahuiYu/neuralgym

#CMD ["python", "main.py", "--image", "path-to-input-image", "--output", "path-to-output-image", "--checkpoint_dir", "model/", "--watermark_type", "istock"]

#- [ ] Faire le docker run propre
#- [ ] Faire une commande en interractif qui run le project
#- [ ] Transphormer la commande en directive CMD
#- [ ]
