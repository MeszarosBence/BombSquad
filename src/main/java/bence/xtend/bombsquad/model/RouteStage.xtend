package bence.xtend.bombsquad.model

import org.eclipse.xtend.lib.annotations.Data

@Data class RouteStage {
	int row
	int col
	boolean reactorCell
	
	override toString() {
		var tos = "(" + row + ";" + col + ")"
		if (reactorCell) tos += "[R]"
		return tos
	}
}