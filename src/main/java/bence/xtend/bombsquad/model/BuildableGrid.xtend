package bence.xtend.bombsquad.model

import java.util.List

interface BuildableGrid extends RowBasedGrid {
	def void addRow(List<GridCell> row)
}