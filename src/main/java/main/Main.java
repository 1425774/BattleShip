package main;

import controller.Game;
import controller.PlayerVersusPlayer;

public class Main {
	
	public static String AUTO_FILE = "";
	public static boolean AUTOMATION = false;

	/** Main class which creates the game. **/
	public static void main(String args[]) {
		if (args.length > 0) {
			AUTO_FILE = args[0];
			AUTOMATION = true;
		}
		Game controller = new PlayerVersusPlayer();
		controller.playOneGame();
		
		/** TODO : multiple game modes
		Scanner scanner = new Scanner(System.in); 
		System.out.println("Indica el modo de juego (1: jugador contra jugador, 2: jugador contra ia)");
		String input = scanner.nextLine();
		
		if (if (input.equals("1"))) {
			Game controller = new PlayerVersusPlayerController();
		} else if (input.equals("2")) { 
			Game controller = new PlayerVersusIAController();
		}**/		
	}
}
