
#### This My Dockerfile for ds in my team.


## run this command 

docker run -i -t -v [Path]:/opt/notebooks -p [Port]:8888 9d7641e84299 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"

