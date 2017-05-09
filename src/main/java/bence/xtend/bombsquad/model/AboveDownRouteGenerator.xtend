package bence.xtend.bombsquad.model

import java.util.ArrayList
import java.util.List

class AboveDownRouteGenerator implements RouteGenerator {
	
	BombSquadGrid grid
	package var List<RouteStage> route = new ArrayList()
	
	new (BombSquadGrid grid) {
		this.grid = grid;
	}
	
	override generateRoute(int startColumn, int numberOfReactors) {
		return generateRoute(0, startColumn, numberOfReactors) as List<RouteStage>
	}
	
	def generateRoute(int row, int col, int reactors) {
		var remainingReactors = reactors;
 		val isReactor = grid.isReactorCell(row, col)
		route.add(new RouteStage(row, col, isReactor));
		
		if (isReactor) {
  			remainingReactors--
			if (remainingReactors == 0) return route
 		    else return generateRoute(row + 1, col, remainingReactors) 
  		}
		
		if (noReactorFoundInRow(row)) {
			return generateRoute(row + 1, col, remainingReactors)
		} 
		
		return generateRoute(row, col + oneStepToNextReactor(row, col), remainingReactors)
	}
	
	def noReactorFoundInRow(int row) {
		grid.getReactorColumnInRow(row) == -1
	}
	
	def oneStepToNextReactor(int row, int col) {
		grid.getReactorColumnInRow(row).compareTo(col)
	}	
}