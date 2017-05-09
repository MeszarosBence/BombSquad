package bence.xtend.bombsquad.model

import java.util.List

interface RowBasedGrid {
	def List<GridCell> getRow(int row)
	def int getNumberOfRows()

}
