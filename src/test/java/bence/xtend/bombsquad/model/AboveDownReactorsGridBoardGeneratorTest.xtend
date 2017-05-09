package bence.xtend.bombsquad.model

import org.junit.Test

import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.DROID
import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.EMPTY
import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.REACTOR
import static org.hamcrest.CoreMatchers.is
import static org.junit.Assert.*

class AboveDownReactorsGridBoardGeneratorTest {
		
	AboveDownReactorsGridBoardGenerator bs = new AboveDownReactorsGridBoardGenerator(0,0)
	
	@Test def void generate2x2BoardWithOneReactor() {
		boardGeneratorTest(2,2,1)
	}
	
	@Test def void generate3x3BoardWith2Reactors() {
		boardGeneratorTest(3, 3, 2)
	}
	
	@Test def void generate6x6BoardWith5Reactors() {
		boardGeneratorTest(6, 6, 5)
	}
	
	@Test def void generate3x3BoardWith5Reactors() {
		boardGeneratorTest(3,3,5)
	}
	
	@Test def void putDroidOnTheFirstRowOfTheBoard() {
		boardGeneratorTest(4,4,3)
		
		assertThat(bs.startColumn,  is(findInRow(0, DROID)))
		assertThat(elementsInRow(0, EMPTY), is(3));
	}
	
	@Test def void generateAndCheckCellByCell() {
		boardGeneratorTest(2,2,1)
	}
	
	
	def boardGeneratorTest(int width, int height, int reactors) {
		val expectedReactors = if (reactors >= height) height - 1 else reactors
		bs = new AboveDownReactorsGridBoardGenerator(width, height)
		
		bs.generateBoard(reactors)
		
		println(bs.grid)
		assertThatBoardWasGeneratedFor(width, height, expectedReactors)
	}
	
	def assertThatBoardWasGeneratedFor(int width, int height, int expectedReactors) {
		assertThat(emptyNodesInTheRow(0), is(width - 1))
		
		var actualReactors = 0;
		for (var i = 1; i < height; i++) {
			assertTrue(emptyNodesInTheRow(i) >= width - 1)
			actualReactors += reactorsInTheRow(i)
			assertTrue(reactorsInTheRow(i) <= 1)
		}
		
		assertThat(actualReactors, is(expectedReactors))
	}
	
	def elementsInRow(int i, GridCell element) {
		bs.grid.getRow(i).contains(element);
		return bs.grid.getRow(i).filter[equals(element)].size
	}
	
	def findInRow(int i, GridCell element) {
		return bs.grid.getRow(i).indexOf(element)
	}
	
	def reactorsInTheRow(int i) {
		return elementsInRow(i, REACTOR)
	}
	
	def emptyNodesInTheRow(int i) {
		return elementsInRow(i, EMPTY)
	}
}
