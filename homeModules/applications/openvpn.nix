{ pkgs, ... }: {
  services.openvpn = {
    enable = true;
    servers = {
      defaultVPN = { config = '' config /root/nixos/openvpn/defaultVPN.conf ''; };
    };
  };
}
