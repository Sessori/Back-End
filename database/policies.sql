CREATE POLICY "allow upload for authenticated"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (true);

CREATE POLICY "allow read for all"
ON storage.objects
FOR SELECT
TO public
USING (true);

CREATE POLICY "allow update for authenticated"
ON storage.objects
FOR UPDATE
TO authenticated
USING (true)
WITH CHECK (true);

CREATE POLICY "allow delete for authenticated"
ON storage.objects
FOR DELETE
TO authenticated
USING (true);