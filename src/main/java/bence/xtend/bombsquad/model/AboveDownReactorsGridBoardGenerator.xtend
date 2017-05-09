package bence.xtend.bombsquad.model

import java.util.ArrayList
import java.util.Random

import static java.lang.Math.pow
import java.util.List
import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.EMPTY
import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.REACTOR
import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.DROID

class AboveDownReactorsGridBoardGenerator implements BombSquadBoardGenerator {
	private int width
	private int height

	package var startColumn = 0
	
	package var grid = new BombSquadListBasedGrid
	
	package int numberOfReactors = 0

	new(int width, int height) {
		this.width = width
		this.height = height
	}

	public override def generateBoard(int reactors) {
		numberOfReactors = if(reactors >= height) height - 1 else reactors
		val int reactorRows = randomGenerateReactorRows(0, numberOfReactors) as Integer
		for (var i = 0; i < height; i++) {
			fillCurrentRow(i, reactorRows)
		}
		
		return grid
	}

	def fillCurrentRow(int i, int reactorRows) {
		var row = new ArrayList(width)
		if (itIsFirstRow(i)) {
			fillRowWithoutReactor(row)
			addDroid(row)
		}
		else if (itIsReactorRow(reactorRows, i)) fillRowWithReactor(row)
		else fillRowWithoutReactor(row)
		grid.addRow(row)
	}
	
	
	def addDroid(List<GridCell> row) {
		startColumn = (row.size / 2).intValue
		row.set(startColumn, DROID)
		grid.setStartColumn(startColumn)
		
	}

	def itIsReactorRow(int reactorRows, int i) {
		reactorRows.bitwiseAnd(pow(2, i).intValue) == pow(2, i)
	}

	def itIsFirstRow(int i) {
		i == 0
	}

	def fillRowWithReactor(List<GridCell> row) {
		fillRowWithoutReactor(row)
		row.set(setRandomPlace, REACTOR
		)
	}

	def setRandomPlace() {
		Math.abs(new Random().nextInt) % width
	}

	def fillRowWithoutReactor(List<GridCell> row) {
		for (var j = 0; j < width; j ++) {
			row.add(EMPTY)
		}
	}
	
	def randomGenerateReactorRows(int place, int reactors) {

		if (reactors == 0) {
			return place
		}

		val rand = Math.abs(new Random().nextInt)
		var index = (rand % (height - 1)) + 1
		var int nextPlace = pow(2, index).intValue
		if ((nextPlace.bitwiseAnd(place)) == nextPlace) {
			return randomGenerateReactorRows(place, reactors)
		}

		return randomGenerateReactorRows(place + nextPlace, reactors - 1)

	}
}
