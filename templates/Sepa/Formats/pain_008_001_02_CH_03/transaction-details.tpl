    <PmtInf>
      <PmtInfId>{$group.reference}</PmtInfId>
      <PmtMtd>DD</PmtMtd>
      <PmtTpInf>
        <SvcLvl>
          <Prtry>CHDD</Prtry>
        </SvcLvl>
        <LclInstrm>
          <Prtry>DDCOR1</Prtry>
        </LclInstrm>
      </PmtTpInf>
      <ReqdColltnDt>{$group.collection_date|crmDate:"%Y-%m-%d"}</ReqdColltnDt>
      <Cdtr>
        <Nm>{$creditor.name}</Nm>
        <PstlAdr>
          <Ctry>CH</Ctry>
          <AdrLine>{$creditor.address}</AdrLine>
        </PstlAdr>
      </Cdtr>
      <CdtrAcct>
        <Id>
          <IBAN>{$creditor.iban}</IBAN>
        </Id>
      </CdtrAcct>
      <CdtrAgt>
        <FinInstnId>
          <ClrSysMmbId>
            <MmbId>09000</MmbId>
          </ClrSysMmbId>
          <Othr>
            <Id>{$creditor.identifier}</Id>
          </Othr>
        </FinInstnId>
      </CdtrAgt>
      <CdtrSchmeId>
        <Id>
          <PrvtId>
            <Othr>
              <Id>{$creditor.identifier}</Id>
              <SchmeNm>
                <Prtry>CHDD</Prtry>
              </SchmeNm>
            </Othr>
          </PrvtId>
        </Id>
      </CdtrSchmeId>
{foreach from=$contributions item="contribution"}
      <DrctDbtTxInf>
        <PmtId>
          <InstrId>INSTRID-{$contribution.end2endID}</InstrId>
          <EndToEndId>{$contribution.end2endID}</EndToEndId>
        </PmtId>
        <InstdAmt Ccy="CHF">{$contribution.total_amount}</InstdAmt>
        <DbtrAgt>
          <FinInstnId>
            <ClrSysMmbId>
              <MmbId>09000</MmbId>
            </ClrSysMmbId>
          </FinInstnId>
        </DbtrAgt>
        <Dbtr>
          <Nm>{$contribution.display_name}</Nm>
          <PstlAdr>
            <Ctry>{$contribution.ctry}</Ctry>
            <AdrLine>{$contribution.street_address}</AdrLine>
            <AdrLine>{$contribution.postal_code} {$contribution.city}</AdrLine>
          </PstlAdr>
        </Dbtr>
        <DbtrAcct>
          <Id>
            <IBAN>{$contribution.iban}</IBAN>
          </Id>
        </DbtrAcct>
        <RmtInf>
          <Strd>
            <CdtrRefInf>
              <Tp>
                <CdOrPrtry>
                  <Prtry>ESR</Prtry>
                </CdOrPrtry>
              </Tp>
              <Ref>200002000000004443332000061</Ref>
            </CdtrRefInf>
          </Strd>
        </RmtInf>
      </DrctDbtTxInf>
{/foreach}
    </PmtInf>
