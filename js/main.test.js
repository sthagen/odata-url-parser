const echo = require('./main')

test('echoes of text', () => {
  expect(echo('text')).toBe('text');
});
