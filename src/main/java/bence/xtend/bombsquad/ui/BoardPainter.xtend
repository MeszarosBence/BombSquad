package bence.xtend.bombsquad.ui

import bence.xtend.bombsquad.model.RowBasedGrid
import java.awt.Graphics
import java.awt.Graphics2D
import java.io.IOException
import javax.imageio.ImageIO

import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.DROID
import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.REACTOR

class BoardPainter implements PaintingStrategy {
	
	val DROID_PIC = ImageIO.read(BoardPainter.getResourceAsStream("/bence/xtend/bombsquad/ui/resources/droid.gif"));
	val REACTOR_PIC = ImageIO.read(BoardPainter.getResourceAsStream("/bence/xtend/bombsquad/ui/resources/reactor.gif"));
	val PX50 = 50;
	
	RowBasedGrid grid

	new(RowBasedGrid grid) {
		this.grid = grid
	}

	override void doDrawing(Graphics g) throws IOException {
		var g2d = g as Graphics2D;

		for (var i = 0; i < grid.numberOfRows; i++) {
			var row = grid.getRow(i)
			for (var j = 0; j < row.length; j++) {
				if (row.get(j) == REACTOR) {
					g2d.drawImage(REACTOR_PIC, PX50 * j, PX50 * i, null);
				}
				if (row.get(j) == DROID) {
					g2d.drawImage(DROID_PIC, PX50 * j, PX50 * i, null);
				}
			}
		}
	}
}