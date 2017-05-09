package bence.xtend.bombsquad.model;

import bence.xtend.bombsquad.model.AboveDownReactorsGridBoardGenerator;
import bence.xtend.bombsquad.model.BombSquadListBasedGrid;
import bence.xtend.bombsquad.model.GridCell;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.hamcrest.CoreMatchers;
import org.hamcrest.Matcher;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class AboveDownReactorsGridBoardGeneratorTest {
  private AboveDownReactorsGridBoardGenerator bs = new AboveDownReactorsGridBoardGenerator(0, 0);
  
  @Test
  public void generate2x2BoardWithOneReactor() {
    this.boardGeneratorTest(2, 2, 1);
  }
  
  @Test
  public void generate3x3BoardWith2Reactors() {
    this.boardGeneratorTest(3, 3, 2);
  }
  
  @Test
  public void generate6x6BoardWith5Reactors() {
    this.boardGeneratorTest(6, 6, 5);
  }
  
  @Test
  public void generate3x3BoardWith5Reactors() {
    this.boardGeneratorTest(3, 3, 5);
  }
  
  @Test
  public void putDroidOnTheFirstRowOfTheBoard() {
    this.boardGeneratorTest(4, 4, 3);
    int _findInRow = this.findInRow(0, BombSquadListBasedGrid.DROID);
    Matcher<Integer> _is = CoreMatchers.<Integer>is(Integer.valueOf(_findInRow));
    Assert.<Integer>assertThat(Integer.valueOf(this.bs.startColumn), _is);
    int _elementsInRow = this.elementsInRow(0, BombSquadListBasedGrid.EMPTY);
    Matcher<Integer> _is_1 = CoreMatchers.<Integer>is(Integer.valueOf(3));
    Assert.<Integer>assertThat(Integer.valueOf(_elementsInRow), _is_1);
  }
  
  @Test
  public void generateAndCheckCellByCell() {
    this.boardGeneratorTest(2, 2, 1);
  }
  
  public void boardGeneratorTest(final int width, final int height, final int reactors) {
    int _xifexpression = (int) 0;
    if ((reactors >= height)) {
      _xifexpression = (height - 1);
    } else {
      _xifexpression = reactors;
    }
    final int expectedReactors = _xifexpression;
    AboveDownReactorsGridBoardGenerator _aboveDownReactorsGridBoardGenerator = new AboveDownReactorsGridBoardGenerator(width, height);
    this.bs = _aboveDownReactorsGridBoardGenerator;
    this.bs.generateBoard(reactors);
    InputOutput.<BombSquadListBasedGrid>println(this.bs.grid);
    this.assertThatBoardWasGeneratedFor(width, height, expectedReactors);
  }
  
  public void assertThatBoardWasGeneratedFor(final int width, final int height, final int expectedReactors) {
    int _emptyNodesInTheRow = this.emptyNodesInTheRow(0);
    Matcher<Integer> _is = CoreMatchers.<Integer>is(Integer.valueOf((width - 1)));
    Assert.<Integer>assertThat(Integer.valueOf(_emptyNodesInTheRow), _is);
    int actualReactors = 0;
    for (int i = 1; (i < height); i++) {
      {
        int _emptyNodesInTheRow_1 = this.emptyNodesInTheRow(i);
        boolean _greaterEqualsThan = (_emptyNodesInTheRow_1 >= (width - 1));
        Assert.assertTrue(_greaterEqualsThan);
        int _actualReactors = actualReactors;
        int _reactorsInTheRow = this.reactorsInTheRow(i);
        actualReactors = (_actualReactors + _reactorsInTheRow);
        int _reactorsInTheRow_1 = this.reactorsInTheRow(i);
        boolean _lessEqualsThan = (_reactorsInTheRow_1 <= 1);
        Assert.assertTrue(_lessEqualsThan);
      }
    }
    Matcher<Integer> _is_1 = CoreMatchers.<Integer>is(Integer.valueOf(expectedReactors));
    Assert.<Integer>assertThat(Integer.valueOf(actualReactors), _is_1);
  }
  
  public int elementsInRow(final int i, final GridCell element) {
    List<GridCell> _row = this.bs.grid.getRow(i);
    _row.contains(element);
    List<GridCell> _row_1 = this.bs.grid.getRow(i);
    final Function1<GridCell, Boolean> _function = new Function1<GridCell, Boolean>() {
      public Boolean apply(final GridCell it) {
        return Boolean.valueOf(it.equals(element));
      }
    };
    Iterable<GridCell> _filter = IterableExtensions.<GridCell>filter(_row_1, _function);
    return IterableExtensions.size(_filter);
  }
  
  public int findInRow(final int i, final GridCell element) {
    List<GridCell> _row = this.bs.grid.getRow(i);
    return _row.indexOf(element);
  }
  
  public int reactorsInTheRow(final int i) {
    return this.elementsInRow(i, BombSquadListBasedGrid.REACTOR);
  }
  
  public int emptyNodesInTheRow(final int i) {
    return this.elementsInRow(i, BombSquadListBasedGrid.EMPTY);
  }
}
