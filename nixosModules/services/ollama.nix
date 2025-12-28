{ pkgs, ... }: {
  services.ollama = {
    enable = true;
    loadModels = [ "llama3.1:8b" "mistral" ];
    environmentVariables = {
      OLLAMA_KEEP_ALIVE = "-1";
    };
  };

  environment.systemPackages = with pkgs; [ lmstudio ];
}
