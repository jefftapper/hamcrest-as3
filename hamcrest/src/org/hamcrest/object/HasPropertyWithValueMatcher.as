package org.hamcrest.object {

    import flash.utils.describeType;

    import org.hamcrest.Description;
    import org.hamcrest.Matcher;
    import org.hamcrest.TypeSafeDiagnosingMatcher;

    /**
     * Matches if <code>item.hasOwnProperty(propertyName)</code> is <code>true</code>, and the value
     * for that property matches the given valueMatcher.
     *
     * @see org.hamcrest.object.hasProperty
     */
    public class HasPropertyWithValueMatcher extends TypeSafeDiagnosingMatcher {

        private var _propertyName:String;
        private var _valueMatcher:Matcher;

        /**
         * Constructor.
         *
         * @param propertyName Name of the property the item being matched must have.
         * @param valueMatcher Matcher to apply to the value of the item property
         */
        public function HasPropertyWithValueMatcher(propertyName:String, valueMatcher:Matcher) {

            super(Object);
            _propertyName = propertyName;
            _valueMatcher = valueMatcher;
        }

        /**
         * @inheritDoc
         */
        override public function matchesSafely(item:Object, mismatchDescription:Description):Boolean {

            if (!item.hasOwnProperty(_propertyName)) {
                mismatchDescription.appendText('No property "' + _propertyName + '"');
                return false;
            }

            var propertyValue:* = item[_propertyName];
            var valueMatches:Boolean = _valueMatcher.matches(propertyValue);

            if (!valueMatches) {
                mismatchDescription.appendText('property "' + _propertyName + '" ');
                _valueMatcher.describeMismatch(propertyValue, mismatchDescription);
            }
            return valueMatches;
        }

        /**
         * @inheritDoc
         */
        override public function describeTo(description:Description):void {

            description
                .appendText("an object with property ")
                .appendValue(_propertyName)
                .appendText(" and value ")
                .appendDescriptionOf(_valueMatcher);
        }

    }
}
