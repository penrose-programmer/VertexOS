{ pkgs, ... }: {
  keymaps = [
    {
      mode = "n";
      key = "<leader>m";
      action = "<cmd>Neotree toggle<CR>";
      options = {
        desc = "Leader Test";
      };
    }
  ];
}
