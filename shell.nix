{
  pkgs ? import <nixpkgs> { },
  workdir ? null,
}:

let
  cwd = builtins.getEnv "PWD";

  finalWorkdir =
    if workdir == null then
      cwd
    else if pkgs.lib.hasPrefix "/" workdir then
      workdir
    else
      pkgs.lib.concatStringsSep "/" [
        cwd
        workdir
      ];
in

pkgs.mkShell {
  name = "odc-lab2-shell";

  buildInputs = with pkgs; [
    xorg.xhost
    xorg.xeyes
    xorg.libX11
    xorg.libXext
    xorg.libXtst
    xorg.libXrender
    xorg.libXau
    xorg.libxcb
    xclip
    inetutils
    docker
    gnumake
  ];

  shellHook = ''
    echo "🧪 Entrando al entorno ODC Lab"

    if [ -z "$DISPLAY" ]; then
      export DISPLAY="192.168.0.100:0"
    fi

    export LIBGL_ALWAYS_INDIRECT=1
    export WORKDIR="${finalWorkdir}"

    alias run-qemu='docker exec -d odc_lab2 make runQEMU'
    alias run-gpiom='docker exec -it odc_lab2 make runGPIOM'
    alias xeyes-test="docker exec -it odc_lab2 xeyes"
    alias odc-shell='docker exec -it odc_lab2 bash'
    alias start-container="docker run -dt --name odc_lab2 --rm -v ${finalWorkdir}:/local --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix odc_lab2"

    echo "📁 Usando ruta de trabajo: $WORKDIR"
    echo "✅ Aliases disponibles:"
    echo " - start-container"
    echo " - run-qemu"
    echo " - run-gpiom"
    echo " - xeyes-test"
    echo " - odc-shell"
  '';
}
