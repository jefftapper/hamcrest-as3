package org.hamcrest.core {
  
  public class IsCollectionContainingMatcher extends TypeSafeMatcher {
    
    private var _elementMatcher:Matcher;
    
    public function IsCollectionContainingMatcher(elementMatcher:Matcher) {
      
      super(Array);
      _elementMatcher = elementMatcher;
    }
    
    override public function matchesSafely(collection:Object, mismatchDescription:Description):void {
      
      for each (var item:Object in (collection as Array)) {
        if (_elementMatcher.matches(item)) {
          return true;
        }
      }
      
      return false;
    }
    
    override public function describeTo(description:Description):void {
      description.appendText("a collection containing ").appendDescriptionOf(_elementMatcher);
    }
  }
}