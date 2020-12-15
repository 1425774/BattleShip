package view;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

import main.Main;

public class ViewMockAutomation extends View {

	public ViewMockAutomation() {
		super();
		File input = new File(Main.AUTO_FILE);
		
		try {
			this.setScanner(new Scanner(input));
		} catch (FileNotFoundException e) {
			System.out.println("Automation couldn't find the inputs file that was given through parameter. Please check spelling and try again.");
			System.exit(1);
		}
	}

}
