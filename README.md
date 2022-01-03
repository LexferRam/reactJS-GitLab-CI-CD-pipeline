# GitLab CI/CD

Este proyecto contiene integracion continua, compila, genera la imagen de docker y la sube al registry de gitlab


1. agregar variables de entorno en gitlab(secrets)
2. escribir pipeline que ejecute el build     
3. login a registry    
4. escribir pipeline que cree la imagen de docker usando el build del paso anterior(artifact)
5. docker push al registry  
