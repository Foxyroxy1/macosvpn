/*
 Copyright (c) 2015 halo. https://github.com/halo/macosvpn

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the
 "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to
 the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

extension CFArray: SequenceType {

  // Just a little helper to loop through a CFArray.
  // Kindly provided by http://stackoverflow.com/a/32127187
  public func generate() -> AnyGenerator<AnyObject> {
    var index = -1
    let maxIndex = CFArrayGetCount(self)
    return AnyGenerator{
      index += 1
      guard index < maxIndex else {
        return nil
      }
      let unmanagedObject: UnsafePointer<Void> = CFArrayGetValueAtIndex(self, index)
      let rec = unsafeBitCast(unmanagedObject, AnyObject.self)
      return rec
    }
  }

}
