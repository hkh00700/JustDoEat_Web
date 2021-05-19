package game;

import java.util.ArrayList;

import org.springframework.ui.Model;

import game.GameDTO;

public interface GameCommand {
	public ArrayList<GameDTO> execute(Model model);
}
