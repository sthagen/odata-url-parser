// Generated from Count.g4 by ANTLR 4.8
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link CountParser}.
 */
public interface CountListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link CountParser#count}.
	 * @param ctx the parse tree
	 */
	void enterCount(CountParser.CountContext ctx);
	/**
	 * Exit a parse tree produced by {@link CountParser#count}.
	 * @param ctx the parse tree
	 */
	void exitCount(CountParser.CountContext ctx);
}