{ ... }: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        #command = "${pkgs.greetd.tuigreet}/bin/tuigreet --asterisks --user-menu --time --greeting 'Bro, you're cooked'";
        command = "uwsm start default";
        user = "destony";
      };
    };
  };
}
