package bence.xtend.bombsquad.model

import org.junit.Test

import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.DROID
import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.EMPTY
import static bence.xtend.bombsquad.model.BombSquadListBasedGrid.REACTOR
import static org.hamcrest.CoreMatchers.is
import static org.junit.Assert.*
import java.util.List
import java.util.ArrayList

class AboveDownRouteGeneratorTest {
	
	private var List<RouteStage> expectedRoute = new ArrayList
	var grid = new BombSquadListBasedGrid()
	
	int numberOfReactors
	
	@Test def void generateRouteFor2x2Board() {
		grid.addRow(#[EMPTY,  DROID])
		grid.addRow(#[REACTOR,EMPTY])
		grid.startColumn = 1
		numberOfReactors = 1
		
		
		expectedRoute.add(new RouteStage(0,1,false))
		expectedRoute.add(new RouteStage(1,1,false))
		expectedRoute.add(new RouteStage(1,0,true))
		
		verifyGeneratedRoute()
	}
	
	@Test def void generateRouteFor2x3Board() {
		
		grid.addRow(#[EMPTY,  DROID])
		grid.addRow(#[EMPTY,  EMPTY])
		grid.addRow(#[REACTOR,EMPTY])
		numberOfReactors = 1
		grid.startColumn = 1
		
		expectedRoute.add(new RouteStage(0,1,false))
		expectedRoute.add(new RouteStage(1,1,false))
		expectedRoute.add(new RouteStage(2,1,false))
		expectedRoute.add(new RouteStage(2,0,true))
		
		verifyGeneratedRoute()
	}
	
	@Test def void generateRouteFor5x5BoardWith3Reactors() {
		numberOfReactors = 3
		grid.startColumn = 2
		
		grid.addRow(#[EMPTY, EMPTY,  DROID, EMPTY, EMPTY])
		grid.addRow(#[EMPTY, EMPTY,  EMPTY, EMPTY, EMPTY])
		grid.addRow(#[REACTOR, EMPTY,  EMPTY, EMPTY, EMPTY])
		grid.addRow(#[EMPTY, EMPTY,  EMPTY, REACTOR, EMPTY])
		grid.addRow(#[EMPTY, EMPTY,  EMPTY, EMPTY, REACTOR])
		
		expectedRoute.add(new RouteStage(0,2,false))
		expectedRoute.add(new RouteStage(1,2,false))
		expectedRoute.add(new RouteStage(2,2,false))
		expectedRoute.add(new RouteStage(2,1,false))
		expectedRoute.add(new RouteStage(2,0,true))
		expectedRoute.add(new RouteStage(3,0,false))
		expectedRoute.add(new RouteStage(3,1,false))
		expectedRoute.add(new RouteStage(3,2,false))
		expectedRoute.add(new RouteStage(3,3,true))
		expectedRoute.add(new RouteStage(4,3,false))
		expectedRoute.add(new RouteStage(4,4,true))
		
		verifyGeneratedRoute()
		
	}
	
	def verifyGeneratedRoute() {
		println(grid)
		var rg = new AboveDownRouteGenerator(grid)
		var route = rg.generateRoute(grid.startColumn, numberOfReactors)
		println(route)
		assertThat(route, is(expectedRoute))
	}
}