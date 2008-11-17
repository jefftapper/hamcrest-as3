package org.hamcrest.core {
  
  public class AnyOfMatcher extends ShortcutCombinationMatcher {
    
    public function AnyOfMatcher(matchers:Array) {
      super(matchers, "or");
    }
    
    public function matches(item:Object):Boolean {
      return matchesOrShortcuts(item, true);
    }
  }
}