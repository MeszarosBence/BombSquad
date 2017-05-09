package bence.xtend.bombsquad.ui

import bence.xtend.bombsquad.model.AboveDownReactorsGridBoardGenerator
import bence.xtend.bombsquad.model.AboveDownRouteGenerator
import bence.xtend.bombsquad.model.BombSquadGrid
import bence.xtend.bombsquad.model.RouteStage
import java.awt.Color
import java.util.List
import javax.swing.JFrame
import javax.swing.SwingUtilities
import javax.swing.Timer

class SwingUILauncher extends JFrame {
	
	var BombSquadGrid board
	List<RouteStage> route
	var ui = new BombSquadSwingUI()
	
	def generateBoard() {
        this.board =  new AboveDownReactorsGridBoardGenerator(16, 12).generateBoard(8)
	}
	
	def generateRoute() {
        this.route = new AboveDownRouteGenerator(board).generateRoute(board.startColumn, 8)
	}
	
	def setupUI() {
		this.title = "Bomb Squad"
        this.visible = true
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(850, 650);
        setLocationRelativeTo(null);
	}
	
	def buildUI() {
        ui.background = Color.WHITE
        
		ui.boardPainter = new BoardPainter(board)
		ui.routePainter = new RoutePainter(route)
		
		add(ui)
	}
	
	def startAnimation() {
    	var timer = new Timer(300, ui);
	    timer.setInitialDelay(300);
	    timer.start();
	}
	
	def init() {
		generateBoard()
		generateRoute()
		setupUI()
		buildUI()
		startAnimation()
	}

    def static void main(String[] args) {
		
        SwingUtilities.invokeLater([| 
        	var bs = new SwingUILauncher()
        	bs.init()
        ])
    }
}