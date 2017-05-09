package bence.xtend.bombsquad.model

import java.util.List
import java.util.ArrayList

class BombSquadListBasedGrid implements BuildableGrid, BombSquadGrid {
	public static val DROID = new GridCell("D")
	public static val EMPTY = new GridCell("0")
	public static val REACTOR = new GridCell("1")

	package var List<List<GridCell>> grid = new ArrayList()
	private int startColumn

	override addRow(List<GridCell> row) {
		grid.add(row)
	}

	override List<GridCell> getRow(int i) {
		grid.get(i)
	}

	override int getNumberOfRows() {
		grid.length
	}

	override toString() {
		val tos = new StringBuilder()
		grid.forEach[element, index|tos.append(element).append("\n")]
		return tos.toString
	}

	def findInRow(int i, GridCell element) {
		return grid.get(i).indexOf(element)
	}

	override getReactorColumnInRow(int row) {
		return findInRow(row, REACTOR)
	}

	public override isReactorCell(int row, int col) {
		return grid.get(row).get(col).equals(REACTOR);
	}
	
	package def void setStartColumn(int startColumn) {
		this.startColumn = startColumn
	}
	
	override getStartColumn() {
		return startColumn
	}
}
