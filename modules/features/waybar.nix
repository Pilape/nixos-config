let
    palette = builtins.fromJSON (builtins.readFile ../colors.json);
in { self, inputs, ... }: {
	
    perSystem = { pkgs, ... }: {

        packages.myWaybar = inputs.wrapper-modules.wrappers.waybar.wrap {
	    inherit pkgs;

	    "style.css".content = "
		window#waybar {
		    background-color: ${palette.background};
		}

		tooltip {
		    background-color: ${palette.background};
		    border-radius: 0px;
		}

		.module {
		    padding-left: 10px;
		    padding-right: 10px;
		    margin: 2px;

		    background-color: ${palette.background};
		    
		    border-style: solid;
		    border-width: 2px;
		    border-color: ${palette.primary};

		    color: ${palette.primary};
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
		    format-disconnected = "<span color='${palette.error}'>Disconnected</span>";
		};

		modules-center = [ "niri/workspaces" ];
		modules-right = [ "clock" "battery" ];

		clock = {
		    interval = 60;
		    format = "{0:%H:%M} | {0:%d/%m/%Y} | W{0:%W}";

		    tooltip-format = "<tt>{calendar}</tt>";
		    calendar = {
			format = {
			    months = "<span color='${palette.secondary}'><b>{}</b></span>";
			    weekdays = "<span color='${palette.primary}'>{}</span>";
			    days = "<span color='${palette.foreground}'>{}</span>";
			    today = "<span color='${palette.secondary}'><b>{}</b></span>";
			};
		    };
		};

		battery = {
		    interval = 30;
		    states = {
			warning = 30;
			critical = 15;
		    };


		    format = "Battery: {capacity}%";
		    format-warning = "Battery: <span color='${palette.warning}'>{capacity}%</span>";
		};

	    };
	};

    };

}
