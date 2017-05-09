package bence.xtend.bombsquad.model

interface BombSquadGrid extends RowBasedGrid {
	def int getReactorColumnInRow(int row)
	def boolean isReactorCell(int row, int col)
	def int getStartColumn()
}