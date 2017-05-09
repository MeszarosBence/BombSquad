package bence.xtend.bombsquad.model;

import bence.xtend.bombsquad.model.AboveDownRouteGenerator;
import bence.xtend.bombsquad.model.BombSquadListBasedGrid;
import bence.xtend.bombsquad.model.GridCell;
import bence.xtend.bombsquad.model.RouteStage;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.hamcrest.CoreMatchers;
import org.hamcrest.Matcher;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class AboveDownRouteGeneratorTest {
  private List<RouteStage> expectedRoute = new ArrayList<RouteStage>();
  
  private BombSquadListBasedGrid grid = new BombSquadListBasedGrid();
  
  private int numberOfReactors;
  
  @Test
  public void generateRouteFor2x2Board() {
    this.grid.addRow(Collections.<GridCell>unmodifiableList(CollectionLiterals.<GridCell>newArrayList(BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.DROID)));
    this.grid.addRow(Collections.<GridCell>unmodifiableList(CollectionLiterals.<GridCell>newArrayList(BombSquadListBasedGrid.REACTOR, BombSquadListBasedGrid.EMPTY)));
    this.grid.setStartColumn(1);
    this.numberOfReactors = 1;
    RouteStage _routeStage = new RouteStage(0, 1, false);
    this.expectedRoute.add(_routeStage);
    RouteStage _routeStage_1 = new RouteStage(1, 1, false);
    this.expectedRoute.add(_routeStage_1);
    RouteStage _routeStage_2 = new RouteStage(1, 0, true);
    this.expectedRoute.add(_routeStage_2);
    this.verifyGeneratedRoute();
  }
  
  @Test
  public void generateRouteFor2x3Board() {
    this.grid.addRow(Collections.<GridCell>unmodifiableList(CollectionLiterals.<GridCell>newArrayList(BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.DROID)));
    this.grid.addRow(Collections.<GridCell>unmodifiableList(CollectionLiterals.<GridCell>newArrayList(BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY)));
    this.grid.addRow(Collections.<GridCell>unmodifiableList(CollectionLiterals.<GridCell>newArrayList(BombSquadListBasedGrid.REACTOR, BombSquadListBasedGrid.EMPTY)));
    this.numberOfReactors = 1;
    this.grid.setStartColumn(1);
    RouteStage _routeStage = new RouteStage(0, 1, false);
    this.expectedRoute.add(_routeStage);
    RouteStage _routeStage_1 = new RouteStage(1, 1, false);
    this.expectedRoute.add(_routeStage_1);
    RouteStage _routeStage_2 = new RouteStage(2, 1, false);
    this.expectedRoute.add(_routeStage_2);
    RouteStage _routeStage_3 = new RouteStage(2, 0, true);
    this.expectedRoute.add(_routeStage_3);
    this.verifyGeneratedRoute();
  }
  
  @Test
  public void generateRouteFor5x5BoardWith3Reactors() {
    this.numberOfReactors = 3;
    this.grid.setStartColumn(2);
    this.grid.addRow(Collections.<GridCell>unmodifiableList(CollectionLiterals.<GridCell>newArrayList(BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.DROID, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY)));
    this.grid.addRow(Collections.<GridCell>unmodifiableList(CollectionLiterals.<GridCell>newArrayList(BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY)));
    this.grid.addRow(Collections.<GridCell>unmodifiableList(CollectionLiterals.<GridCell>newArrayList(BombSquadListBasedGrid.REACTOR, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY)));
    this.grid.addRow(Collections.<GridCell>unmodifiableList(CollectionLiterals.<GridCell>newArrayList(BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.REACTOR, BombSquadListBasedGrid.EMPTY)));
    this.grid.addRow(Collections.<GridCell>unmodifiableList(CollectionLiterals.<GridCell>newArrayList(BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.EMPTY, BombSquadListBasedGrid.REACTOR)));
    RouteStage _routeStage = new RouteStage(0, 2, false);
    this.expectedRoute.add(_routeStage);
    RouteStage _routeStage_1 = new RouteStage(1, 2, false);
    this.expectedRoute.add(_routeStage_1);
    RouteStage _routeStage_2 = new RouteStage(2, 2, false);
    this.expectedRoute.add(_routeStage_2);
    RouteStage _routeStage_3 = new RouteStage(2, 1, false);
    this.expectedRoute.add(_routeStage_3);
    RouteStage _routeStage_4 = new RouteStage(2, 0, true);
    this.expectedRoute.add(_routeStage_4);
    RouteStage _routeStage_5 = new RouteStage(3, 0, false);
    this.expectedRoute.add(_routeStage_5);
    RouteStage _routeStage_6 = new RouteStage(3, 1, false);
    this.expectedRoute.add(_routeStage_6);
    RouteStage _routeStage_7 = new RouteStage(3, 2, false);
    this.expectedRoute.add(_routeStage_7);
    RouteStage _routeStage_8 = new RouteStage(3, 3, true);
    this.expectedRoute.add(_routeStage_8);
    RouteStage _routeStage_9 = new RouteStage(4, 3, false);
    this.expectedRoute.add(_routeStage_9);
    RouteStage _routeStage_10 = new RouteStage(4, 4, true);
    this.expectedRoute.add(_routeStage_10);
    this.verifyGeneratedRoute();
  }
  
  public void verifyGeneratedRoute() {
    InputOutput.<BombSquadListBasedGrid>println(this.grid);
    AboveDownRouteGenerator rg = new AboveDownRouteGenerator(this.grid);
    int _startColumn = this.grid.getStartColumn();
    List<RouteStage> route = rg.generateRoute(_startColumn, this.numberOfReactors);
    InputOutput.<List<RouteStage>>println(route);
    Matcher<List<RouteStage>> _is = CoreMatchers.<List<RouteStage>>is(this.expectedRoute);
    Assert.<List<RouteStage>>assertThat(route, _is);
  }
}
