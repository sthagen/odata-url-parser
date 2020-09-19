const {
    FileStream,
    CommonTokenStream,
} = require('antlr4/index');
//const {ParseTreeWalker} = require('antlr4/tree');
const {CountLexer} = require.main.require('./CountLexer');
const {CountParser} = require.main.require('./CountParser');
// const {CountListener} = require('./CountListener').CountListener;

class Visitor {
    visitChildren(ctx) {
        if (!ctx) {
            return;
        }

        if (ctx.children) {
            return ctx.children.map(child => {
                if (child.children && child.children.length !== 0) {
                    return child.accept(this);
                } else {
                    return child.getText();
                }
            });
        }
    }
}

process.argv.forEach(function (val, index, array) {
    if (index > 1) {
        console.log('Parsing ', index - 1 + ' : ' + val, ' as count option :: ');
        const chars = new FileStream(val);
        const lexer = new CountLexer(chars);
        const tokens  = new CommonTokenStream(lexer);
        const parser = new CountParser(tokens);
        parser.buildParseTrees = true;
        const tree = parser.count();
        console.log(tree.accept(new Visitor()));
    }
});
