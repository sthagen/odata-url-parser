// Generated from SimpleQueryOptions.g4 by ANTLR 4.8
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link SimpleQueryOptionsParser}.
 */
public interface SimpleQueryOptionsListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link SimpleQueryOptionsParser#queryoptions}.
	 * @param ctx the parse tree
	 */
	void enterQueryoptions(SimpleQueryOptionsParser.QueryoptionsContext ctx);
	/**
	 * Exit a parse tree produced by {@link SimpleQueryOptionsParser#queryoptions}.
	 * @param ctx the parse tree
	 */
	void exitQueryoptions(SimpleQueryOptionsParser.QueryoptionsContext ctx);
	/**
	 * Enter a parse tree produced by {@link SimpleQueryOptionsParser#queryoption}.
	 * @param ctx the parse tree
	 */
	void enterQueryoption(SimpleQueryOptionsParser.QueryoptionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SimpleQueryOptionsParser#queryoption}.
	 * @param ctx the parse tree
	 */
	void exitQueryoption(SimpleQueryOptionsParser.QueryoptionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SimpleQueryOptionsParser#inlinecount}.
	 * @param ctx the parse tree
	 */
	void enterInlinecount(SimpleQueryOptionsParser.InlinecountContext ctx);
	/**
	 * Exit a parse tree produced by {@link SimpleQueryOptionsParser#inlinecount}.
	 * @param ctx the parse tree
	 */
	void exitInlinecount(SimpleQueryOptionsParser.InlinecountContext ctx);
	/**
	 * Enter a parse tree produced by {@link SimpleQueryOptionsParser#index_}.
	 * @param ctx the parse tree
	 */
	void enterIndex_(SimpleQueryOptionsParser.Index_Context ctx);
	/**
	 * Exit a parse tree produced by {@link SimpleQueryOptionsParser#index_}.
	 * @param ctx the parse tree
	 */
	void exitIndex_(SimpleQueryOptionsParser.Index_Context ctx);
	/**
	 * Enter a parse tree produced by {@link SimpleQueryOptionsParser#schemaversion}.
	 * @param ctx the parse tree
	 */
	void enterSchemaversion(SimpleQueryOptionsParser.SchemaversionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SimpleQueryOptionsParser#schemaversion}.
	 * @param ctx the parse tree
	 */
	void exitSchemaversion(SimpleQueryOptionsParser.SchemaversionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SimpleQueryOptionsParser#skip}.
	 * @param ctx the parse tree
	 */
	void enterSkip(SimpleQueryOptionsParser.SkipContext ctx);
	/**
	 * Exit a parse tree produced by {@link SimpleQueryOptionsParser#skip}.
	 * @param ctx the parse tree
	 */
	void exitSkip(SimpleQueryOptionsParser.SkipContext ctx);
	/**
	 * Enter a parse tree produced by {@link SimpleQueryOptionsParser#top}.
	 * @param ctx the parse tree
	 */
	void enterTop(SimpleQueryOptionsParser.TopContext ctx);
	/**
	 * Exit a parse tree produced by {@link SimpleQueryOptionsParser#top}.
	 * @param ctx the parse tree
	 */
	void exitTop(SimpleQueryOptionsParser.TopContext ctx);
}