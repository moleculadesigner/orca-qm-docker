# Docker Image with Orca QM Engine
Proper installation of Orca software is sometimes a tricky move, especially
if it is intended to use on HPC cluster. This docker image with Orca 5.0.4, xTB,
and Crest allows one to easily deploy ready-to-use QM machinery.

## Build
Acoording to Orca EULA, I am not allowed to distribute its binaries, so to build
the image, you need to:
1. register on [Orca Forum](https://orcaforum.kofo.mpg.de) and download the dynamically pre-compiled package [orca_5_0_4_linux_x86-64_shared_openmpi411.tar.xz](https://orcaforum.kofo.mpg.de/app.php/dlext/?view=detail&df_id=189).
2. repack the archive under `orca.tar.xz` filename
    ``` shell
    tar -xf orca_5_0_4_linux_x86-64_shared_openmpi411.tar.xz
    mv ./orca_5_0_4_linux_x86-64_shared_openmpi411 ./orca
    tar -cf orca.tar ./orca
    xz -9 orca.tar
    rm -r ./orca
    ```
3. add it to `orca-5.0.4-micromamba` directory

Then having a file `orca-5.0.4-micromamba/orca.tar.xz`, run the docker build command:
``` shell
docker build -t orca:5.0.4-micromamba ./orca-5.0.4-micromamba
```

## Run
Once the image is built, it's possible to run computations. To mount data from host filesystem (e.g. `./examples`), provide `-v /path/to/host/data:/home/orcauser/data -w /home/orcauser/data` flags:

``` shell
docker run -ti --rm -v ./examples:/home/orcauser/data -w /home/orcauser/data orca:5.0.4-micromamba
```

If xTB or Crest is needed, activate `(orca)` environment in the container shell:
``` shell
micromamba activate orca
```

To run the example computations, run inside the container:
``` shell
orca ./hydrogen.inp
```

(Works if `examples` directory is mounted to the container working directory, see commands above).
