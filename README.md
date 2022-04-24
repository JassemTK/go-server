# go-server
Demo subject of buildah podman & skopeo.
## Commands
To build an image using Buildah from a Dockerfile v2 :   
`buildah bud -f Dockerfile  -t <img_name>:<tag>`  

To inspect created image using buildah:   
  `buildah images`    

Get the ID from previous command and run:     
`buildah inspect <ID>`

Create a container out of the img using the pod manager:     
`podman container create -it -p 8081 <img_ID>  ./app`  

Run the container:
`podman run <container_name>`

Get exposed port:    
`podman ps`   

Try curl or your browser for a greeting back.

