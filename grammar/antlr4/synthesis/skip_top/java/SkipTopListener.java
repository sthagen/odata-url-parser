// Generated from SkipTop.g4 by ANTLR 4.8
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link SkipTopParser}.
 */
public interface SkipTopListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link SkipTopParser#skip_top}.
	 * @param ctx the parse tree
	 */
	void enterSkip_top(SkipTopParser.Skip_topContext ctx);
	/**
	 * Exit a parse tree produced by {@link SkipTopParser#skip_top}.
	 * @param ctx the parse tree
	 */
	void exitSkip_top(SkipTopParser.Skip_topContext ctx);
	/**
	 * Enter a parse tree produced by {@link SkipTopParser#skip}.
	 * @param ctx the parse tree
	 */
	void enterSkip(SkipTopParser.SkipContext ctx);
	/**
	 * Exit a parse tree produced by {@link SkipTopParser#skip}.
	 * @param ctx the parse tree
	 */
	void exitSkip(SkipTopParser.SkipContext ctx);
	/**
	 * Enter a parse tree produced by {@link SkipTopParser#top}.
	 * @param ctx the parse tree
	 */
	void enterTop(SkipTopParser.TopContext ctx);
	/**
	 * Exit a parse tree produced by {@link SkipTopParser#top}.
	 * @param ctx the parse tree
	 */
	void exitTop(SkipTopParser.TopContext ctx);
}