package bence.xtend.bombsquad.ui

import bence.xtend.bombsquad.model.RouteStage
import java.awt.Graphics
import java.awt.Graphics2D
import java.io.IOException
import java.util.List
import javax.imageio.ImageIO

class RoutePainter implements PaintingStrategy {

	val HORIZONTAL = ImageIO.read(ClassLoader.getResourceAsStream("/bence/xtend/bombsquad/ui/resources/horizontal.gif"));
	val VERTICAL = ImageIO.read(RoutePainter.getResourceAsStream("/bence/xtend/bombsquad/ui/resources/vertical.gif"));
	val UPPER_RIGHT = ImageIO.read(RoutePainter.getResourceAsStream("/bence/xtend/bombsquad/ui/resources/upper_right.gif"));
	val UPPER_LEFT = ImageIO.read(RoutePainter.getResourceAsStream("/bence/xtend/bombsquad/ui/resources/upper_left.gif"));
	val LOWER_LEFT = ImageIO.read(RoutePainter.getResourceAsStream("/bence/xtend/bombsquad/ui/resources/lower_left.gif"));
	val LOWER_RIGHT = ImageIO.read(RoutePainter.getResourceAsStream("/bence/xtend/bombsquad/ui/resources/lower_right.gif"));
	val OK = ImageIO.read(RoutePainter.getResourceAsStream("/bence/xtend/bombsquad/ui/resources/thumb.gif"));

	List<RouteStage> route
	int element = 1

	new(List<RouteStage> route) {
		this.route = route
	}

	override void doDrawing(Graphics g) throws IOException {
		var g2d = g as Graphics2D;

		for (var i = 1; i < element; i++) {
			drawStage(i, g2d);
		}
		element++
	}
	
	def drawStage(int i, Graphics2D g2d) {
		if (i >= route.length)
			return
			
		var stage = route.get(i)
		g2d.drawImage(determineImage(route, i), 50 * stage.col, 50 * stage.row, null)
	}

	def determineImage(List<RouteStage> stages, int i) {
		if (stages.length > i + 1 && i > 0) {
			return determineImageFrom3Points(stages, i)
		}

		return OK
	}
	
	
	def determineImageFrom3Points(List<RouteStage> stages, int i) {
		var prev = stages.get(i - 1)
		var curr = stages.get(i)
		var next = stages.get(i + 1)
		var image = VERTICAL
		
		if (curr.isReactorCell)
			return OK

		if (prev.row < curr.row && next.col > curr.col)
			image = LOWER_LEFT

		if (prev.row < curr.row && next.col < curr.col)
			image = LOWER_RIGHT

		if (prev.col > curr.col && next.row > curr.row)
			image = UPPER_LEFT

		if (prev.col < curr.col && next.row > curr.row)
			image = UPPER_RIGHT

		if (prev.col < curr.col && next.row == curr.row)
			image = HORIZONTAL

		if (prev.col > curr.col && next.row == curr.row)
			image = HORIZONTAL

		return image
	}
}
