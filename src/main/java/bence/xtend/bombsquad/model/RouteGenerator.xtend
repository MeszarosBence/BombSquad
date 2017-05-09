package bence.xtend.bombsquad.model

import java.util.List

interface RouteGenerator {
	def List<RouteStage> generateRoute(int startColumn, int numberOfReactors)
}