# Use a base image with Python and Conda pre-installed
FROM continuumio/miniconda3

# Install R base
RUN apt-get update && apt-get install -y r-base && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy environment.yml to the container
COPY environment.yml /app/environment.yml

# Install dependencies
RUN conda env create -f environment.yml

# Clone the repository
RUN apt-get install -y git && git clone https://github.com/UNC-DATA-730/unit-1-assignment-Cind3r-1.git /app/repo

# Activate the environment by default
RUN echo "source activate myenv" > ~/.bashrc
ENV PATH=/opt/conda/envs/myenv/bin:$PATH

# Expose ports as necessary
EXPOSE 8888
#EXPOSE 5000

# Execute any commands on startup
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]