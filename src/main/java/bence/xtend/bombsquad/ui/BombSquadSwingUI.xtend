package bence.xtend.bombsquad.ui

import java.awt.Graphics
import java.awt.event.ActionEvent
import java.awt.event.ActionListener
import java.io.IOException
import javax.swing.JPanel
import org.eclipse.xtend.lib.annotations.Accessors

class BombSquadSwingUI extends JPanel implements ActionListener {
	@Accessors(PUBLIC_SETTER) PaintingStrategy boardPainter
	@Accessors(PUBLIC_SETTER) PaintingStrategy routePainter
	
	override paintComponent(Graphics g) {

		super.paintComponent(g)
		try {
			boardPainter.doDrawing(g)
			routePainter.doDrawing(g)
		} catch (IOException e) {
			e.printStackTrace()
		}
	}

	override actionPerformed(ActionEvent e) {
		repaint()
	}
}
