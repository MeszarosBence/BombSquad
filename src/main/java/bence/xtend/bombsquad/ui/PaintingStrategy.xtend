package bence.xtend.bombsquad.ui

import java.awt.Graphics
import java.io.IOException

interface PaintingStrategy {
	def void doDrawing(Graphics g) throws IOException
}