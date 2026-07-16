let
    palette = (import ./colors.nix);
    color1 = "#ff2266";
    color2 = "#12bb66";
    color3 = "#085533";
    color4 = "#ffffdd";
    color5 = "#001100";
in { self, inputs, ... }: {
	
    perSystem = { pkgs, ... }: {

        packages.myWaybar = inputs.wrapper-modules.wrappers.waybar.wrap {
	    inherit pkgs;

	    "style.css".content = "
		window#waybar 
		    background-color: ${color1};
		}

		tooltip {
		    background-color: ${color5};
		    border-radius: 0px;
		}

		.module {
		    padding-left: 10px;
		    padding-right: 10px;
		    margin: 2px;

		    background-color: ${color3};
		    color: ${color4};
		}
	    ";

	    settings = { 
		height = 10;
		margin = 5;

		spacing = 10;

		layer = "top";
		position = "top";

		modules-left = [ "cpu" "memory" "network" ];

		cpu = {
		    interval = 10;
		    format = "CPU: {usage}% ";
		    max-length = 10;
		};

		memory = {
		    interval = 30;
		    format = "RAM: {}%";
		};

		network = {
		    format = "{essid} ({signalStrength}%) | {ipaddr}";
		    format-disconnected = "<span color='${color1}'>Disconnected</span>";
		};

		modules-center = [ "niri/workspaces" ];
		modules-right = [ "clock" "battery" ];

		clock = {
		    interval = 60;
		    format = "{0:%H:%M} | {0:%d/%m/%Y} | W{0:%W}";

		    tooltip-format = "<tt>{calendar}</tt>";
		    calendar = {
			format = {
			    months = "<span color='${color1}'><b>{}</b></span>";
			    weekdays = "<span color='${color2}'>{}</span>";
			    days = "<span color='${color3}'>{}</span>";
			    today = "<span color='${color1}'><b>{}</b></span>";
			};
		    };
		};

		battery = {
		    interval = 30;
		    states = {
			warning = 30;
			critical = 15;
		    };


		    format = "{capacity}%";
		};

	    };
	};

    };

}
