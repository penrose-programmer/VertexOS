{ pkgs, ... }: {
  services.ollama = {
    enable = true;
    loadModels = [ "llama3.1:8b" "mistral" ];
  };
}
