package org.hamcrest.core {

    import org.hamcrest.BaseMatcher;
    import org.hamcrest.Description;
    import org.hamcrest.Matcher;

    /**
     * Decorates another Matcher, retaining the behavior but allowing tests
     * to be slightly more expressive.
     *
     * Unfortunately AS3 already has an <code>is</code> keywork, so its not quite as nice as it could be.
     *
     * For example:  assertThat(cheese, equalTo(smelly))
     *          vs.  assertThat(cheese, isA(equalTo(smelly)))
     */
    public class IsMatcher extends BaseMatcher {

        private var _matcher:Matcher;

        public function IsMatcher(matcher:Matcher) {
            _matcher = matcher;
        }

        override public function matches(item:Object):Boolean {
            return _matcher.matches(item);
        }

        override public function describeTo(description:Description):void {
            description.appendText("is ").appendDescriptionOf(_matcher);
        }

        override public function describeMismatch(item:Object, mismatchDescription:Description):void {
            _matcher.describeMismatch(item, mismatchDescription);
        }
    }
}
