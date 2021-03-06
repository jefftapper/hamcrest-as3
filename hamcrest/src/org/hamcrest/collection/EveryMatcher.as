package org.hamcrest.collection {

    import org.hamcrest.Description;
    import org.hamcrest.Matcher;
    import org.hamcrest.TypeSafeDiagnosingMatcher;

    /**
     * Matches an Array or Array-like Object if every item matches the given Matcher.
     *
     * Factory method is <code>everyItem</code>
     *
     * @see org.hamcrest.everyItem
     * @example
     * <listing version="3.0">
     *  assertThat([1, 2, 3], everyItem(instanceOf(Number)));
     * </listing>
     */
    public class EveryMatcher extends TypeSafeDiagnosingMatcher {

        private var _matcher:Matcher;

        /**
         * Constructor
         *
         * @param matcher Matcher to apply to each item
         */
        public function EveryMatcher(matcher:Matcher) {

            super(Array);
            _matcher = matcher;
        }

        /**
         * Match each item in an Array or Array-like Object against the matcher given in the constructor.
         *
         * @param collection Array / Array-like Object
         * @param mismatchDescription Description object to report mismatch to.
         */
        override public function matchesSafely(collection:Object, description:Description):Boolean {

            for each (var item:Object in collection) {
                if (!_matcher.matches(item)) {
                    description.appendText("an item ");
                    _matcher.describeMismatch(item, description);
                    return false;
                }
            }
            return true;
        }

        /**
         * @param description Description to describe this matcher to.
         */
        override public function describeTo(description:Description):void {
            description.appendText("every item is ").appendDescriptionOf(_matcher);
        }
    }
}
